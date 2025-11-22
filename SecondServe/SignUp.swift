//
//  SignUp.swift
//  SecondServe
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore   // <- optional (only if you want a profile doc)

struct SignUp: View {
    @State private var SignUpEmail: String = ""
    @State private var SignUpPassword: String = ""
    @State private var isLoading = false
    @State private var status: String? = nil

    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                Text("Second Serve")
                    .font(.largeTitle).bold()
                    .padding(.top, 40)

                Text("Create an account")
                    .font(.system(size: 19, design: .rounded)).bold()

                Text("Enter your email to sign up for this app")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
            }
            .offset(y: -80)

            VStack(spacing: 12) {
                TextField("email@domain.com", text: $SignUpEmail)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 330, height: 47)

                SecureField("password", text: $SignUpPassword)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 330, height: 47)
            }
            .offset(y: 60)

            Button {
                createAccount()
            } label: {
                if isLoading { ProgressView() }
                else { Text("Continue").frame(maxWidth: .infinity) }
            }
            .frame(width: 330, height: 47)
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .disabled(isLoading || !isValid)
            .offset(y: 155)

            if let status {
                Text(status)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .frame(width: 330)
                    .offset(y: 210)
            }
        }

        HStack {
            Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.4))
            Text("OR").font(.caption).foregroundColor(.gray)
            Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.4))
        }
        .padding(.top, 200)

        VStack {
            Button("Continue with Google") { /* later */ }
                .frame(width: 330, height: 47)
                .background(Color.gray.opacity(0.3))
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Button("Continue with Apple") { /* later */ }
                .frame(width: 330, height: 47)
                .background(Color.gray.opacity(0.3))
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.top, 10)

        Text("By clicking continue, you agree to our Terms of Service and Privacy Policy")
            .multilineTextAlignment(.center)
            .font(.caption)
            .padding(.top, 12)
    }

    private var isValid: Bool {
        SignUpEmail.contains("@") && SignUpEmail.contains(".") && SignUpPassword.count >= 6
    }

    private func createAccount() {
        status = nil
        guard isValid else {
            status = "Enter a valid email and a 6+ character password."
            return
        }

        isLoading = true

        Auth.auth().createUser(withEmail: SignUpEmail, password: SignUpPassword) { result, error in
            if let err = error as NSError? {
                isLoading = false
                if err.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                    status = "An account with this email already exists. Try logging in."
                } else {
                    status = err.localizedDescription
                }
                return
            }

            if let uid = result?.user.uid {
                let db = Firestore.firestore()
                db.collection("users").document(uid).setData([
                    "email": SignUpEmail.lowercased(),
                    "createdAt": FieldValue.serverTimestamp()
                ], merge: true)
            }

            isLoading = false
            status = "Account created ✅"
        }
    }
}

#Preview { SignUp() }
